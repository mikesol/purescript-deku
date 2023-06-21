module Deku.DOM.Attr.Itemprop where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Itemprop = Itemprop

instance Attr Tags.A_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Abbr_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Acronym_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Address_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Applet_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Area_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Article_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Aside_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Audio_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.B_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Base_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Basefont_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Bdi_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Bdo_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Big_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Blockquote_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Body_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Br_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Button_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Canvas_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Caption_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Center_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Cite_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Code_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Col_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Colgroup_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Xdata_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Datalist_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Dd_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Del_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Details_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Dfn_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Dialog_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Dir_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Div_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Dl_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Dt_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Em_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Embed_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Fieldset_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Figcaption_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Figure_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Font_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Footer_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Form_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Frame_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Frameset_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.H1_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.H2_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.H3_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.H4_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.H5_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.H6_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Head_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Header_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Hr_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Html_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.I_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Iframe_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Img_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Input_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Ins_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Kbd_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Label_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Legend_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Li_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Link_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Main_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Map_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Mark_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Meta_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Meter_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Nav_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Noframes_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Noscript_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Object_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Ol_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Optgroup_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Option_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Output_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.P_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Param_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Picture_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Pre_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Progress_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Q_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Rp_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Rt_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Ruby_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.S_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Samp_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Script_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Section_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Select_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Small_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Source_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Span_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Strike_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Strong_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Style_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Sub_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Summary_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Sup_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Svg_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Table_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Tbody_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Td_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Template_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Textarea_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Tfoot_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Th_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Thead_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Time_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Title_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Tr_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Track_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Tt_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.U_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Ul_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Var_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Video_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr Tags.Wbr_ Itemprop String where
  pureAttr Itemprop value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "itemprop", value }

  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "itemprop", value: prop' value }

instance Attr everything Itemprop Unit where
  pureAttr Itemprop _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "itemprop", value: unset' }
  mapAttr Itemprop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "itemprop", value: unset' }
