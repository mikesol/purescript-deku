module Deku.DOM.Attr.Style where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Style = Style

instance Attr Tags.A_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Abbr_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Acronym_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Address_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Applet_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Area_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Article_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Aside_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Audio_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.B_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Base_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Basefont_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Bdi_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Bdo_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Big_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Blockquote_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Body_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Br_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Button_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Canvas_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Caption_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Center_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Cite_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Code_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Col_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Colgroup_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Xdata_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Datalist_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Dd_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Del_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Details_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Dfn_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Dialog_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Dir_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Div_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Dl_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Dt_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Em_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Embed_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Fieldset_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Figcaption_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Figure_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Font_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Footer_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Form_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Frame_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Frameset_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.H1_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.H2_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.H3_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.H4_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.H5_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.H6_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Head_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Header_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Hr_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Html_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.I_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Iframe_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Img_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Input_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Ins_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Kbd_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Label_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Legend_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Li_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Link_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Main_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Map_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Mark_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Meta_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Meter_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Nav_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Noframes_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Noscript_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Object_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Ol_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Optgroup_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Option_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Output_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.P_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Param_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Picture_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Pre_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Progress_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Q_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Rp_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Rt_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Ruby_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.S_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Samp_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Script_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Section_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Select_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Small_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Source_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Span_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Strike_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Strong_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Style_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Sub_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Summary_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Sup_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Svg_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Table_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Tbody_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Td_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Template_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Textarea_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Tfoot_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Th_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Thead_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Time_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Title_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Tr_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Track_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Tt_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.U_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Ul_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Var_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Video_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Wbr_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Animate_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.AnimateMotion_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Circle_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.ClipPath_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Defs_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Desc_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Ellipse_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.FeBlend_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.FeColorMatrix_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.FeComponentTransfer_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.FeComposite_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.FeDisplacementMap_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.FeDropShadow_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.FeFlood_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.FeGaussianBlur_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.FeImage_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.FeMerge_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.FeMorphology_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.FeOffset_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.FeSpecularLighting_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.FeTile_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.FeTurbulence_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Filter_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.ForeignObject_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.G_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Image_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Line_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.LinearGradient_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Marker_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Mask_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Path_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Pattern_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Polygon_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Polyline_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.RadialGradient_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Rect_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Set_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Stop_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Switch_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Symbol_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Text_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.TextPath_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Tspan_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr Tags.Use_ Style String where
  pureAttr Style value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "style", value }

  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "style", value: prop' value }

instance Attr everything Style Unit where
  pureAttr Style _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "style", value: unset' }
  mapAttr Style evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "style", value: unset' }
