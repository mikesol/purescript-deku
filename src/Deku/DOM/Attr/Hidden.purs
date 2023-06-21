module Deku.DOM.Attr.Hidden where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Hidden = Hidden

instance Attr Tags.A_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Abbr_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Acronym_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Address_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Applet_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Area_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Article_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Aside_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Audio_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.B_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Base_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Basefont_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Bdi_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Bdo_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Big_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Blockquote_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Body_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Br_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Button_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Canvas_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Caption_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Center_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Cite_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Code_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Col_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Colgroup_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Xdata_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Datalist_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Dd_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Del_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Details_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Dfn_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Dialog_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Dir_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Div_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Dl_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Dt_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Em_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Embed_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Fieldset_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Figcaption_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Figure_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Font_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Footer_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Form_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Frame_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Frameset_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.H1_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.H2_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.H3_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.H4_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.H5_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.H6_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Head_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Header_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Hr_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Html_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.I_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Iframe_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Img_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Input_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Ins_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Kbd_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Label_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Legend_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Li_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Link_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Main_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Map_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Mark_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Meta_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Meter_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Nav_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Noframes_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Noscript_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Object_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Ol_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Optgroup_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Option_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Output_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.P_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Param_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Picture_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Pre_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Progress_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Q_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Rp_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Rt_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Ruby_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.S_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Samp_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Script_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Section_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Select_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Small_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Source_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Span_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Strike_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Strong_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Style_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Sub_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Summary_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Sup_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Svg_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Table_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Tbody_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Td_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Template_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Textarea_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Tfoot_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Th_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Thead_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Time_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Title_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Tr_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Track_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Tt_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.U_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Ul_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Var_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Video_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr Tags.Wbr_ Hidden String where
  pureAttr Hidden value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "hidden", value }

  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "hidden", value: prop' value }

instance Attr everything Hidden Unit where
  pureAttr Hidden _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "hidden", value: unset' }
  mapAttr Hidden evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "hidden", value: unset' }
