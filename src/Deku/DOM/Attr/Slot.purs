module Deku.DOM.Attr.Slot where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Slot = Slot

instance Attr Tags.A_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Abbr_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Acronym_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Address_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Applet_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Area_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Article_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Aside_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Audio_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.B_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Base_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Basefont_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Bdi_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Bdo_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Big_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Blockquote_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Body_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Br_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Button_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Canvas_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Caption_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Center_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Cite_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Code_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Col_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Colgroup_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Xdata_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Datalist_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Dd_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Del_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Details_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Dfn_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Dialog_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Dir_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Div_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Dl_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Dt_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Em_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Embed_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Fieldset_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Figcaption_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Figure_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Font_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Footer_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Form_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Frame_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Frameset_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.H1_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.H2_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.H3_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.H4_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.H5_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.H6_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Head_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Header_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Hr_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Html_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.I_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Iframe_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Img_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Input_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Ins_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Kbd_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Label_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Legend_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Li_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Link_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Main_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Map_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Mark_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Meta_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Meter_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Nav_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Noframes_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Noscript_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Object_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Ol_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Optgroup_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Option_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Output_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.P_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Param_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Picture_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Pre_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Progress_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Q_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Rp_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Rt_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Ruby_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.S_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Samp_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Script_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Section_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Select_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Small_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Source_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Span_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Strike_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Strong_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Style_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Sub_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Summary_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Sup_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Svg_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Table_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Tbody_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Td_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Template_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Textarea_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Tfoot_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Th_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Thead_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Time_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Title_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Tr_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Track_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Tt_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.U_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Ul_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Var_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Video_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr Tags.Wbr_ Slot String where
  pureAttr Slot value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slot", value }

  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slot", value: prop' value }

instance Attr everything Slot Unit where
  pureAttr Slot _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "slot", value: unset' }
  mapAttr Slot evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "slot", value: unset' }
