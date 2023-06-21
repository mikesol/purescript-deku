module Deku.DOM.Attr.Class where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Class = Class

instance Attr Tags.A_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Abbr_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Acronym_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Address_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Applet_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Area_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Article_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Aside_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Audio_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.B_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Base_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Basefont_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Bdi_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Bdo_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Big_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Blockquote_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Body_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Br_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Button_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Canvas_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Caption_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Center_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Cite_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Code_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Col_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Colgroup_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Xdata_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Datalist_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Dd_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Del_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Details_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Dfn_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Dialog_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Dir_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Div_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Dl_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Dt_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Em_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Embed_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Fieldset_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Figcaption_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Figure_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Font_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Footer_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Form_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Frame_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Frameset_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.H1_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.H2_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.H3_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.H4_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.H5_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.H6_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Head_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Header_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Hr_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Html_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.I_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Iframe_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Img_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Input_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Ins_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Kbd_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Label_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Legend_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Li_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Link_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Main_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Map_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Mark_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Meta_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Meter_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Nav_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Noframes_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Noscript_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Object_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Ol_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Optgroup_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Option_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Output_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.P_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Param_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Picture_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Pre_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Progress_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Q_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Rp_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Rt_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Ruby_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.S_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Samp_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Script_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Section_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Select_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Small_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Source_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Span_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Strike_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Strong_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Style_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Sub_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Summary_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Sup_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Svg_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Table_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Tbody_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Td_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Template_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Textarea_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Tfoot_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Th_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Thead_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Time_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Title_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Tr_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Track_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Tt_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.U_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Ul_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Var_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Video_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Wbr_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Animate_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.AnimateMotion_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Circle_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.ClipPath_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Defs_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Desc_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Ellipse_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.FeBlend_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.FeColorMatrix_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.FeComponentTransfer_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.FeComposite_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.FeDisplacementMap_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.FeDropShadow_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.FeFlood_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.FeGaussianBlur_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.FeImage_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.FeMerge_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.FeMorphology_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.FeOffset_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.FeSpecularLighting_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.FeTile_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.FeTurbulence_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Filter_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.ForeignObject_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.G_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Image_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Line_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.LinearGradient_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Marker_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Mask_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Path_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Pattern_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Polygon_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Polyline_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.RadialGradient_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Rect_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Set_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Stop_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Switch_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Symbol_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Text_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.TextPath_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Tspan_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr Tags.Use_ Class String where
  pureAttr Class value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "class", value }

  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "class", value: prop' value }

instance Attr everything Class Unit where
  pureAttr Class _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "class", value: unset' }
  mapAttr Class evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "class", value: unset' }
