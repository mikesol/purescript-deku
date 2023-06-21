module Deku.DOM.Attr.Keytype where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Keytype = Keytype

instance Attr Tags.A_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Abbr_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Acronym_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Address_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Applet_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Area_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Article_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Aside_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Audio_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.B_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Base_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Basefont_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Bdi_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Bdo_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Big_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Blockquote_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Body_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Br_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Button_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Canvas_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Caption_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Center_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Cite_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Code_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Col_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Colgroup_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Xdata_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Datalist_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Dd_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Del_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Details_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Dfn_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Dialog_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Dir_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Div_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Dl_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Dt_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Em_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Embed_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Fieldset_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Figcaption_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Figure_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Font_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Footer_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Form_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Frame_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Frameset_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.H1_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.H2_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.H3_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.H4_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.H5_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.H6_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Head_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Header_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Hr_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Html_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.I_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Iframe_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Img_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Input_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Ins_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Kbd_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Label_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Legend_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Li_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Link_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Main_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Map_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Mark_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Meta_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Meter_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Nav_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Noframes_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Noscript_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Object_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Ol_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Optgroup_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Option_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Output_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.P_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Param_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Picture_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Pre_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Progress_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Q_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Rp_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Rt_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Ruby_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.S_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Samp_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Script_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Section_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Select_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Small_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Source_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Span_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Strike_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Strong_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Style_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Sub_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Summary_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Sup_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Svg_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Table_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Tbody_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Td_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Template_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Textarea_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Tfoot_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Th_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Thead_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Time_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Title_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Tr_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Track_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Tt_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.U_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Ul_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Var_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Video_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr Tags.Wbr_ Keytype String where
  pureAttr Keytype value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "keytype", value }

  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keytype", value: prop' value }

instance Attr everything Keytype Unit where
  pureAttr Keytype _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "keytype", value: unset' }
  mapAttr Keytype evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "keytype", value: unset' }
