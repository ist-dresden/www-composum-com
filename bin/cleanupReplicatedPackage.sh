#!/bin/bash
echo "This cleans up an export of the replicated live site, so that we can have a public branch that is exactly like www.composum.com and doesn't contain unfinished pages."
echo "Switch to branch public"
echo "Unpack the downloaded package from /public/ist/composum into content/src/main/content and run this script"
echo "Check again what to commit."
echo "Press enter to continue"
read

set -e
set -xv

if [[ ! $PWD =~ /content/src/main/content$ ]]; then
    cd content/src/main/content
fi

# abort if the path doesn't end in /content/src/main/content or if there is no jcr_root directory
if [[ ! $PWD =~ /content/src/main/content$ ]] || [[ ! -d jcr_root ]]; then
    echo "This script must be run from the root of the project or content/src/main/content directory of the project."
    exit 1
fi

# abort if there is no jcr_root/public/ist/composum/.content.xml file - we are expecting an unpacked package
if [[ ! -f jcr_root/public/ist/composum/.content.xml ]]; then
    echo "No unpacked package of replicated /public/ist/composum found."
    exit 1
fi

rm -fr jcr_root/content
mv jcr_root/public jcr_root/content
rm -fr META-INF/vault

# function like removeRegexMatch that does a replacement instead of a removal - add a third parameter
function replaceRegexMatch {
    local quickregex=$1
    local perlregex=$2
    local replacement=$3
    find jcr_root/content -name .content.xml -exec egrep -q "$quickregex" {} \; -exec perl -0777 -i -pe "s/$perlregex/$replacement/g" {} \;
}

function removeRegexMatch {
    replaceRegexMatch "$1" "$2" ''
}

# remove in all .content.xml files lines that match the regex ^\s+jcr:mixinTypes="\[mix:ReplicatedVersionable\]"\n
removeRegexMatch mix:ReplicatedVersionable '^\s+jcr:mixinTypes="\[mix:ReplicatedVersionable\]"$'
removeRegexMatch cpl:releaseChangeNumber '\n\s+cpl:releaseChangeNumber="[^"]+"'
removeRegexMatch cpl:replicatedVersion '\n\s+cpl:replicatedVersion="[^"]+"'
removeRegexMatch mix:ReplicatedVersionable ',mix:ReplicatedVersionable'

replaceRegexMatch mix:ReplicatedVersionable 'jcr:mixinTypes="\[mix:ReplicatedVersionable\]"' 'jcr:mixinTypes="[mix:versionable]"'
replaceRegexMatch public.ist.composum '\/public\/ist\/composum' '\/content\/ist\/composum'

removeRegexMatch 'key=' '\n\s+key=\"AI[^"]*_SA\"'
removeRegexMatch 'key=' 'key=\"AI[^"]*_SA\"'

# in all files that do contain xmlns:cpl but do NOT contain 'cpl:' remove the xmlns:cpl declaration
for fil in $(find jcr_root/content -name .content.xml -exec egrep -q "xmlns:cpl" {} \; -exec egrep -L cpl: {} \;); do
  echo $fil
  perl -0777 -i -pe 's/xmlns:cpl="http:\/\/sling.composum.com\/platform\/1.0"\n\s+//g' "$fil"
done

removeRegexMatch 'jcr:primaryType="cpp:PageContent"' '\n\s+jcr:mixinTypes="\[mix:versionable\]"'

echo "Done. Check what to commit."
