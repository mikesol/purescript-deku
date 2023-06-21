module Deku.DOM.Attr.Challenge where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Challenge = Challenge

instance Attr Tags.A_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Abbr_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Acronym_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Address_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Applet_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Area_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Article_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Aside_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Audio_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.B_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Base_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Basefont_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Bdi_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Bdo_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Big_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Blockquote_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Body_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Br_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Button_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Canvas_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Caption_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Center_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Cite_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Code_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Col_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Colgroup_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Xdata_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Datalist_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Dd_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Del_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Details_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Dfn_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Dialog_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Dir_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Div_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Dl_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Dt_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Em_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Embed_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Fieldset_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Figcaption_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Figure_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Font_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Footer_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Form_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Frame_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Frameset_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.H1_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.H2_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.H3_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.H4_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.H5_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.H6_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Head_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Header_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Hr_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Html_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.I_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Iframe_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Img_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Input_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Ins_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Kbd_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Label_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Legend_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Li_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Link_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Main_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Map_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Mark_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Meta_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Meter_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Nav_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Noframes_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Noscript_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Object_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Ol_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Optgroup_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Option_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Output_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.P_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Param_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Picture_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Pre_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Progress_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Q_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Rp_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Rt_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Ruby_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.S_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Samp_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Script_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Section_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Select_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Small_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Source_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Span_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Strike_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Strong_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Style_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Sub_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Summary_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Sup_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Svg_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Table_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Tbody_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Td_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Template_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Textarea_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Tfoot_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Th_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Thead_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Time_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Title_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Tr_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Track_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Tt_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.U_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Ul_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Var_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Video_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr Tags.Wbr_ Challenge String where
  pureAttr Challenge value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "challenge", value }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: prop' value }

instance Attr everything Challenge Unit where
  pureAttr Challenge _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "challenge", value: unset' }
  mapAttr Challenge evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "challenge", value: unset' }
