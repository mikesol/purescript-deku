export const oneOffFinalizationRegistry = (target, callback) => {
  const registry = new FinalizationRegistry(() => {
    callback();
  });
  registry.register(target, "foo");
};
