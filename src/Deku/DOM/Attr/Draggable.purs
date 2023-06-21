module Deku.DOM.Attr.Draggable where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Draggable = Draggable

instance Attr Tags.A_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Abbr_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Acronym_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Address_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Applet_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Area_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Article_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Aside_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Audio_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.B_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Base_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Basefont_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Bdi_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Bdo_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Big_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Blockquote_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Body_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Br_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Button_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Canvas_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Caption_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Center_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Cite_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Code_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Col_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Colgroup_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Xdata_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Datalist_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Dd_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Del_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Details_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Dfn_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Dialog_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Dir_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Div_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Dl_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Dt_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Em_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Embed_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Fieldset_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Figcaption_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Figure_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Font_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Footer_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Form_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Frame_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Frameset_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.H1_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.H2_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.H3_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.H4_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.H5_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.H6_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Head_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Header_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Hr_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Html_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.I_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Iframe_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Img_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Input_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Ins_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Kbd_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Label_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Legend_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Li_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Link_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Main_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Map_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Mark_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Meta_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Meter_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Nav_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Noframes_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Noscript_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Object_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Ol_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Optgroup_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Option_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Output_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.P_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Param_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Picture_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Pre_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Progress_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Q_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Rp_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Rt_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Ruby_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.S_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Samp_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Script_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Section_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Select_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Small_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Source_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Span_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Strike_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Strong_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Style_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Sub_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Summary_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Sup_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Svg_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Table_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Tbody_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Td_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Template_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Textarea_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Tfoot_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Th_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Thead_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Time_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Title_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Tr_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Track_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Tt_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.U_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Ul_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Var_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Video_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr Tags.Wbr_ Draggable String where
  pureAttr Draggable value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "draggable", value }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: prop' value }

instance Attr everything Draggable Unit where
  pureAttr Draggable _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "draggable", value: unset' }
  mapAttr Draggable evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "draggable", value: unset' }
