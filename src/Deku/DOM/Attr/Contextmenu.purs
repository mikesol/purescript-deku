module Deku.DOM.Attr.Contextmenu where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Contextmenu = Contextmenu

instance Attr Tags.A_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Abbr_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Acronym_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Address_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Applet_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Area_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Article_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Aside_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Audio_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.B_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Base_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Basefont_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Bdi_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Bdo_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Big_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Blockquote_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Body_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Br_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Button_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Canvas_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Caption_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Center_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Cite_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Code_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Col_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Colgroup_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Xdata_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Datalist_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Dd_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Del_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Details_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Dfn_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Dialog_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Dir_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Div_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Dl_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Dt_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Em_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Embed_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Fieldset_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Figcaption_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Figure_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Font_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Footer_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Form_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Frame_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Frameset_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.H1_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.H2_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.H3_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.H4_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.H5_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.H6_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Head_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Header_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Hr_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Html_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.I_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Iframe_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Img_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Input_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Ins_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Kbd_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Label_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Legend_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Li_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Link_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Main_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Map_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Mark_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Meta_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Meter_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Nav_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Noframes_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Noscript_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Object_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Ol_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Optgroup_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Option_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Output_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.P_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Param_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Picture_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Pre_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Progress_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Q_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Rp_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Rt_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Ruby_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.S_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Samp_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Script_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Section_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Select_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Small_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Source_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Span_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Strike_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Strong_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Style_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Sub_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Summary_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Sup_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Svg_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Table_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Tbody_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Td_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Template_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Textarea_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Tfoot_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Th_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Thead_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Time_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Title_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Tr_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Track_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Tt_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.U_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Ul_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Var_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Video_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr Tags.Wbr_ Contextmenu String where
  pureAttr Contextmenu value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "contextmenu", value }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: prop' value }

instance Attr everything Contextmenu Unit where
  pureAttr Contextmenu _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "contextmenu", value: unset' }
  mapAttr Contextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: unset' }
