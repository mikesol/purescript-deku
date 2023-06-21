module Deku.DOM.Attr.Lang where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Lang = Lang

instance Attr Tags.A_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Abbr_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Acronym_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Address_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Applet_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Area_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Article_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Aside_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Audio_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.B_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Base_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Basefont_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Bdi_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Bdo_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Big_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Blockquote_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Body_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Br_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Button_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Canvas_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Caption_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Center_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Cite_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Code_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Col_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Colgroup_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Xdata_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Datalist_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Dd_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Del_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Details_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Dfn_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Dialog_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Dir_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Div_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Dl_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Dt_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Em_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Embed_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Fieldset_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Figcaption_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Figure_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Font_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Footer_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Form_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Frame_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Frameset_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.H1_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.H2_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.H3_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.H4_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.H5_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.H6_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Head_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Header_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Hr_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Html_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.I_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Iframe_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Img_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Input_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Ins_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Kbd_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Label_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Legend_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Li_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Link_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Main_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Map_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Mark_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Meta_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Meter_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Nav_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Noframes_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Noscript_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Object_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Ol_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Optgroup_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Option_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Output_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.P_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Param_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Picture_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Pre_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Progress_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Q_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Rp_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Rt_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Ruby_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.S_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Samp_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Script_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Section_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Select_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Small_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Source_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Span_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Strike_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Strong_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Style_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Sub_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Summary_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Sup_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Svg_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Table_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Tbody_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Td_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Template_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Textarea_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Tfoot_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Th_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Thead_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Time_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Title_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Tr_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Track_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Tt_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.U_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Ul_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Var_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Video_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Wbr_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.AnimateTransform_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Defs_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Discard_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.FeBlend_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.FeColorMatrix_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.FeComponentTransfer_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.FeComposite_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.FeDisplacementMap_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.FeDistantLight_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.FeFlood_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.FeFuncA_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.FeFuncB_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.FeFuncG_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.FeFuncR_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.FeGaussianBlur_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.FeImage_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.FeMerge_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.FeMergeNode_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.FeMorphology_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.FeOffset_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.FePointLight_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.FeSpecularLighting_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.FeSpotLight_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.FeTile_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.FeTurbulence_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Filter_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Image_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Metadata_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Mpath_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.Switch_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr Tags.View_ Lang String where
  pureAttr Lang value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "lang", value }

  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "lang", value: prop' value }

instance Attr everything Lang Unit where
  pureAttr Lang _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "lang", value: unset' }
  mapAttr Lang evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "lang", value: unset' }
