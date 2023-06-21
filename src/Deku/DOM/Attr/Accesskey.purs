module Deku.DOM.Attr.Accesskey where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Accesskey = Accesskey

instance Attr Tags.A_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Abbr_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Acronym_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Address_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Applet_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Area_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Article_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Aside_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Audio_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.B_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Base_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Basefont_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Bdi_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Bdo_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Big_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Blockquote_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Body_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Br_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Button_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Canvas_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Caption_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Center_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Cite_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Code_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Col_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Colgroup_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Xdata_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Datalist_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Dd_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Del_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Details_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Dfn_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Dialog_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Dir_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Div_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Dl_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Dt_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Em_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Embed_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Fieldset_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Figcaption_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Figure_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Font_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Footer_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Form_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Frame_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Frameset_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.H1_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.H2_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.H3_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.H4_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.H5_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.H6_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Head_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Header_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Hr_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Html_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.I_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Iframe_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Img_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Input_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Ins_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Kbd_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Label_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Legend_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Li_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Link_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Main_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Map_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Mark_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Meta_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Meter_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Nav_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Noframes_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Noscript_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Object_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Ol_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Optgroup_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Option_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Output_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.P_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Param_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Picture_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Pre_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Progress_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Q_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Rp_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Rt_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Ruby_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.S_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Samp_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Script_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Section_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Select_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Small_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Source_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Span_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Strike_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Strong_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Style_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Sub_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Summary_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Sup_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Svg_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Table_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Tbody_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Td_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Template_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Textarea_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Tfoot_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Th_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Thead_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Time_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Title_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Tr_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Track_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Tt_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.U_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Ul_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Var_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Video_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr Tags.Wbr_ Accesskey String where
  pureAttr Accesskey value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "accesskey", value }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: prop' value }

instance Attr everything Accesskey Unit where
  pureAttr Accesskey _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "accesskey", value: unset' }
  mapAttr Accesskey evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "accesskey", value: unset' }
