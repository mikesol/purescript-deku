import * as htmlparser2 from "htmlparser2";

export const createParser = (onOpenTag) => (onText) => (onCloseTag) => () => {
  return new htmlparser2.Parser({
    onopentag(tagname, attributes) {
      onOpenTag(tagname)(attributes)();
    },
    ontext(text) {
      onText(text)();
    },
    onclosetag(tagname) {
      onCloseTag(tagname)();
    },
  });
};

export const write = (parser) => (data) => () => parser.write(data);

export const end = (parser) => () => parser.end();

export const splitOnDelimiter = (delimiter) => (str) =>
  str
    .split(new RegExp(`(${delimiter}[^${delimiter}]+${delimiter})`))
    .map((part) =>
      part.replace(new RegExp(`^${delimiter}|${delimiter}$`, "g"), "")
    );
