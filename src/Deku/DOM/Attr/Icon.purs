module Deku.DOM.Attr.Icon where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Icon = Icon

instance Attr Tags.A_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Abbr_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Acronym_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Address_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Applet_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Area_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Article_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Aside_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Audio_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.B_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Base_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Basefont_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Bdi_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Bdo_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Big_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Blockquote_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Body_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Br_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Button_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Canvas_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Caption_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Center_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Cite_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Code_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Col_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Colgroup_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Xdata_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Datalist_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Dd_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Del_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Details_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Dfn_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Dialog_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Dir_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Div_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Dl_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Dt_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Em_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Embed_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Fieldset_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Figcaption_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Figure_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Font_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Footer_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Form_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Frame_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Frameset_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.H1_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.H2_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.H3_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.H4_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.H5_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.H6_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Head_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Header_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Hr_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Html_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.I_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Iframe_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Img_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Input_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Ins_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Kbd_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Label_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Legend_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Li_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Link_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Main_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Map_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Mark_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Meta_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Meter_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Nav_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Noframes_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Noscript_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Object_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Ol_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Optgroup_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Option_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Output_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.P_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Param_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Picture_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Pre_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Progress_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Q_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Rp_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Rt_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Ruby_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.S_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Samp_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Script_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Section_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Select_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Small_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Source_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Span_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Strike_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Strong_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Style_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Sub_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Summary_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Sup_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Svg_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Table_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Tbody_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Td_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Template_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Textarea_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Tfoot_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Th_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Thead_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Time_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Title_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Tr_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Track_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Tt_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.U_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Ul_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Var_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Video_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr Tags.Wbr_ Icon String where
  pureAttr Icon value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "icon", value }

  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "icon", value: prop' value }

instance Attr everything Icon Unit where
  pureAttr Icon _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "icon", value: unset' }
  mapAttr Icon evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "icon", value: unset' }
