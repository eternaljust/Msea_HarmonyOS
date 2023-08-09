
export function getResourceText(resource: Resource) {
  return getContext(this).resourceManager.getStringSync(resource);
}