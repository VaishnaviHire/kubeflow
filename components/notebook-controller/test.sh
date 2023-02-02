echo -n "   .. Disabling fsGroup in the PSC"
yq -i '.configMapGenerator.[0].literals += "ADD_FSGROUP=false"' controller/manager/kustomization.yaml
echo -e "\r    ✓"

echo -n "   .. Adding ADD_FSGROUP environment variable"
yq -i '.spec.template.spec.containers[0].env += {"name":"ADD_FSGROUP","valueFrom":{"configMapKeyRef":{"name":"config","key":"ADD_FSGROUP"}}}' controller/manager/manager.yaml
echo -e "\r    ✓"
