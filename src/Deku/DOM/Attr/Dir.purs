module Deku.DOM.Attr.Dir where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Dir = Dir

instance Attr Tags.A_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Abbr_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Acronym_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Address_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Applet_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Area_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Article_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Aside_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Audio_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.B_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Base_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Basefont_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Bdi_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Bdo_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Big_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Blockquote_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Body_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Br_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Button_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Canvas_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Caption_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Center_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Cite_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Code_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Col_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Colgroup_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Xdata_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Datalist_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Dd_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Del_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Details_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Dfn_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Dialog_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Dir_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Div_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Dl_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Dt_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Em_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Embed_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Fieldset_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Figcaption_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Figure_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Font_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Footer_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Form_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Frame_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Frameset_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.H1_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.H2_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.H3_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.H4_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.H5_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.H6_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Head_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Header_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Hr_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Html_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.I_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Iframe_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Img_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Input_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Ins_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Kbd_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Label_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Legend_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Li_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Link_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Main_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Map_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Mark_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Meta_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Meter_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Nav_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Noframes_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Noscript_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Object_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Ol_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Optgroup_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Option_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Output_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.P_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Param_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Picture_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Pre_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Progress_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Q_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Rp_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Rt_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Ruby_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.S_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Samp_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Script_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Section_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Select_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Small_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Source_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Span_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Strike_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Strong_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Style_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Sub_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Summary_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Sup_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Svg_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Table_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Tbody_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Td_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Template_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Textarea_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Tfoot_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Th_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Thead_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Time_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Title_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Tr_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Track_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Tt_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.U_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Ul_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Var_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Video_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr Tags.Wbr_ Dir String where
  pureAttr Dir value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "dir", value }

  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dir", value: prop' value }

instance Attr everything Dir Unit where
  pureAttr Dir _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "dir", value: unset' }
  mapAttr Dir evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "dir", value: unset' }
