module Deku.DOM.Attr.Id where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Id = Id

instance Attr Tags.A_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Abbr_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Acronym_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Address_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Applet_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Area_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Article_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Aside_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Audio_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.B_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Base_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Basefont_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Bdi_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Bdo_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Big_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Blockquote_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Body_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Br_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Button_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Canvas_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Caption_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Center_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Cite_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Code_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Col_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Colgroup_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Xdata_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Datalist_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Dd_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Del_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Details_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Dfn_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Dialog_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Dir_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Div_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Dl_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Dt_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Em_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Embed_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Fieldset_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Figcaption_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Figure_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Font_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Footer_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Form_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Frame_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Frameset_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.H1_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.H2_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.H3_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.H4_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.H5_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.H6_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Head_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Header_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Hr_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Html_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.I_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Iframe_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Img_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Input_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Ins_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Kbd_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Label_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Legend_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Li_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Link_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Main_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Map_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Mark_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Meta_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Meter_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Nav_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Noframes_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Noscript_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Object_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Ol_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Optgroup_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Option_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Output_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.P_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Param_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Picture_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Pre_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Progress_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Q_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Rp_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Rt_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Ruby_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.S_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Samp_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Script_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Section_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Select_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Small_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Source_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Span_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Strike_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Strong_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Style_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Sub_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Summary_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Sup_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Svg_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Table_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Tbody_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Td_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Template_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Textarea_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Tfoot_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Th_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Thead_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Time_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Title_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Tr_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Track_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Tt_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.U_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Ul_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Var_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Video_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Wbr_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Animate_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.AnimateMotion_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.AnimateTransform_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Circle_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.ClipPath_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Defs_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Desc_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Discard_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Ellipse_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.FeBlend_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.FeColorMatrix_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.FeComponentTransfer_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.FeComposite_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.FeDisplacementMap_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.FeDistantLight_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.FeDropShadow_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.FeFlood_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.FeFuncA_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.FeFuncB_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.FeFuncG_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.FeFuncR_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.FeGaussianBlur_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.FeImage_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.FeMerge_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.FeMergeNode_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.FeMorphology_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.FeOffset_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.FePointLight_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.FeSpecularLighting_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.FeSpotLight_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.FeTile_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.FeTurbulence_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Filter_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.ForeignObject_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.G_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Image_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Line_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.LinearGradient_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Marker_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Mask_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Metadata_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Mpath_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Path_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Pattern_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Polygon_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Polyline_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.RadialGradient_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Rect_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Set_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Stop_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Switch_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Symbol_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Text_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.TextPath_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Tspan_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.Use_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr Tags.View_ Id String where
  pureAttr Id value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "id", value }

  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "id", value: prop' value }

instance Attr everything Id Unit where
  pureAttr Id _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "id", value: unset' }
  mapAttr Id evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "id", value: unset' }
