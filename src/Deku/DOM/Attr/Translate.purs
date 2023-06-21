module Deku.DOM.Attr.Translate where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Translate = Translate

instance Attr Tags.A_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Abbr_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Acronym_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Address_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Applet_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Area_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Article_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Aside_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Audio_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.B_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Base_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Basefont_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Bdi_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Bdo_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Big_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Blockquote_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Body_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Br_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Button_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Canvas_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Caption_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Center_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Cite_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Code_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Col_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Colgroup_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Xdata_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Datalist_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Dd_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Del_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Details_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Dfn_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Dialog_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Dir_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Div_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Dl_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Dt_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Em_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Embed_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Fieldset_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Figcaption_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Figure_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Font_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Footer_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Form_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Frame_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Frameset_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.H1_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.H2_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.H3_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.H4_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.H5_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.H6_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Head_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Header_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Hr_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Html_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.I_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Iframe_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Img_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Input_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Ins_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Kbd_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Label_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Legend_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Li_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Link_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Main_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Map_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Mark_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Meta_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Meter_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Nav_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Noframes_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Noscript_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Object_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Ol_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Optgroup_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Option_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Output_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.P_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Param_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Picture_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Pre_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Progress_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Q_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Rp_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Rt_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Ruby_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.S_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Samp_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Script_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Section_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Select_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Small_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Source_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Span_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Strike_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Strong_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Style_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Sub_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Summary_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Sup_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Svg_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Table_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Tbody_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Td_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Template_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Textarea_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Tfoot_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Th_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Thead_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Time_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Title_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Tr_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Track_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Tt_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.U_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Ul_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Var_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Video_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr Tags.Wbr_ Translate String where
  pureAttr Translate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "translate", value }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: prop' value }

instance Attr everything Translate Unit where
  pureAttr Translate _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "translate", value: unset' }
  mapAttr Translate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "translate", value: unset' }
