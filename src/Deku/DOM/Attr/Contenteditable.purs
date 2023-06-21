module Deku.DOM.Attr.Contenteditable where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Contenteditable = Contenteditable

instance Attr Tags.A_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Abbr_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Acronym_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Address_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Applet_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Area_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Article_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Aside_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Audio_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.B_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Base_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Basefont_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Bdi_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Bdo_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Big_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Blockquote_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Body_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Br_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Button_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Canvas_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Caption_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Center_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Cite_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Code_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Col_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Colgroup_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Xdata_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Datalist_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Dd_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Del_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Details_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Dfn_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Dialog_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Dir_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Div_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Dl_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Dt_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Em_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Embed_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Fieldset_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Figcaption_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Figure_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Font_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Footer_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Form_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Frame_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Frameset_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.H1_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.H2_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.H3_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.H4_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.H5_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.H6_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Head_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Header_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Hr_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Html_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.I_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Iframe_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Img_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Input_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Ins_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Kbd_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Label_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Legend_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Li_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Link_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Main_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Map_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Mark_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Meta_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Meter_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Nav_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Noframes_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Noscript_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Object_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Ol_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Optgroup_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Option_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Output_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.P_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Param_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Picture_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Pre_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Progress_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Q_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Rp_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Rt_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Ruby_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.S_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Samp_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Script_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Section_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Select_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Small_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Source_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Span_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Strike_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Strong_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Style_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Sub_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Summary_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Sup_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Svg_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Table_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Tbody_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Td_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Template_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Textarea_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Tfoot_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Th_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Thead_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Time_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Title_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Tr_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Track_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Tt_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.U_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Ul_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Var_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Video_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr Tags.Wbr_ Contenteditable String where
  pureAttr Contenteditable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contenteditable", value }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "contenteditable", value: prop' value }

instance Attr everything Contenteditable Unit where
  pureAttr Contenteditable _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "contenteditable", value: unset' }
  mapAttr Contenteditable evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "contenteditable", value: unset' }
