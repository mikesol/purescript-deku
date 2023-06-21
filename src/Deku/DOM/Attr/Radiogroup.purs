module Deku.DOM.Attr.Radiogroup where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Radiogroup = Radiogroup

instance Attr Tags.A_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Abbr_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Acronym_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Address_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Applet_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Area_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Article_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Aside_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Audio_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.B_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Base_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Basefont_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Bdi_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Bdo_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Big_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Blockquote_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Body_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Br_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Button_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Canvas_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Caption_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Center_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Cite_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Code_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Col_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Colgroup_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Xdata_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Datalist_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Dd_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Del_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Details_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Dfn_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Dialog_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Dir_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Div_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Dl_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Dt_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Em_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Embed_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Fieldset_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Figcaption_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Figure_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Font_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Footer_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Form_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Frame_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Frameset_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.H1_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.H2_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.H3_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.H4_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.H5_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.H6_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Head_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Header_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Hr_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Html_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.I_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Iframe_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Img_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Input_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Ins_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Kbd_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Label_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Legend_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Li_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Link_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Main_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Map_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Mark_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Meta_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Meter_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Nav_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Noframes_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Noscript_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Object_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Ol_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Optgroup_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Option_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Output_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.P_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Param_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Picture_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Pre_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Progress_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Q_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Rp_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Rt_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Ruby_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.S_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Samp_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Script_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Section_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Select_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Small_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Source_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Span_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Strike_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Strong_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Style_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Sub_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Summary_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Sup_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Svg_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Table_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Tbody_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Td_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Template_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Textarea_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Tfoot_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Th_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Thead_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Time_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Title_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Tr_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Track_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Tt_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.U_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Ul_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Var_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Video_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr Tags.Wbr_ Radiogroup String where
  pureAttr Radiogroup value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "radiogroup", value }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: prop' value }

instance Attr everything Radiogroup Unit where
  pureAttr Radiogroup _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "radiogroup", value: unset' }
  mapAttr Radiogroup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "radiogroup", value: unset' }
