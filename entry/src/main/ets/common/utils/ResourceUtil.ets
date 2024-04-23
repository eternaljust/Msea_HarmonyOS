
export function getResourceText(resource: Resource) {
  return getContext().resourceManager.getStringSync(resource);
}