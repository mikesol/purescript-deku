module Deku.DOM.Attr.Title where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Title = Title

instance Attr Tags.A_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Abbr_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Acronym_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Address_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Applet_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Area_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Article_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Aside_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Audio_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.B_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Base_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Basefont_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Bdi_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Bdo_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Big_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Blockquote_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Body_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Br_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Button_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Canvas_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Caption_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Center_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Cite_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Code_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Col_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Colgroup_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Xdata_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Datalist_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Dd_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Del_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Details_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Dfn_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Dialog_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Dir_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Div_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Dl_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Dt_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Em_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Embed_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Fieldset_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Figcaption_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Figure_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Font_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Footer_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Form_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Frame_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Frameset_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.H1_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.H2_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.H3_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.H4_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.H5_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.H6_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Head_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Header_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Hr_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Html_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.I_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Iframe_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Img_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Input_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Ins_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Kbd_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Label_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Legend_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Li_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Link_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Main_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Map_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Mark_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Meta_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Meter_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Nav_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Noframes_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Noscript_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Object_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Ol_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Optgroup_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Option_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Output_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.P_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Param_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Picture_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Pre_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Progress_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Q_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Rp_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Rt_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Ruby_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.S_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Samp_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Script_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Section_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Select_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Small_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Source_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Span_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Strike_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Strong_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Style_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Sub_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Summary_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Sup_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Svg_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Table_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Tbody_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Td_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Template_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Textarea_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Tfoot_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Th_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Thead_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Time_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Title_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Tr_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Track_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Tt_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.U_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Ul_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Var_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Video_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr Tags.Wbr_ Title String where
  pureAttr Title value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "title", value }

  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "title", value: prop' value }

instance Attr everything Title Unit where
  pureAttr Title _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "title", value: unset' }
  mapAttr Title evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "title", value: unset' }
