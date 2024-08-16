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

    export const  removeOuterTags = (html) =>
       html.replace(/^[^>]*>([\s\S]*?)<[^<]*$/, '$1');
  
    export const  getOuterTagInfo = (html) => {
      const result = {
          tagName: '',
          attributes: {}
      };
  
      // Regular expression to match the outermost tag and capture the tag name and attributes
      const tagMatch = html.match(/^<(\w+)([^>]*)>/);
  
      if (tagMatch) {
          result.tagName = tagMatch[1];
  
          // Extracting attributes
          const attrString = tagMatch[2];
          const attrRegex = /(\w+)=["']([^"']*)["']/g;
          let match;
  
          while ((match = attrRegex.exec(attrString)) !== null) {
              result.attributes[match[1]] = match[2];
          }
      }
  
      return result;
  }
    