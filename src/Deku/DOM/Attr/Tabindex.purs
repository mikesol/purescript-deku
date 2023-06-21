module Deku.DOM.Attr.Tabindex where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Tabindex = Tabindex

instance Attr Tags.A_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Abbr_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Acronym_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Address_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Applet_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Area_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Article_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Aside_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Audio_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.B_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Base_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Basefont_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Bdi_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Bdo_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Big_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Blockquote_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Body_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Br_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Button_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Canvas_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Caption_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Center_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Cite_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Code_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Col_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Colgroup_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Xdata_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Datalist_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Dd_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Del_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Details_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Dfn_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Dialog_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Dir_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Div_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Dl_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Dt_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Em_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Embed_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Fieldset_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Figcaption_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Figure_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Font_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Footer_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Form_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Frame_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Frameset_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.H1_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.H2_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.H3_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.H4_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.H5_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.H6_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Head_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Header_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Hr_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Html_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.I_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Iframe_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Img_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Input_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Ins_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Kbd_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Label_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Legend_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Li_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Link_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Main_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Map_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Mark_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Meta_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Meter_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Nav_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Noframes_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Noscript_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Object_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Ol_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Optgroup_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Option_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Output_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.P_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Param_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Picture_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Pre_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Progress_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Q_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Rp_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Rt_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Ruby_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.S_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Samp_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Script_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Section_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Select_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Small_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Source_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Span_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Strike_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Strong_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Style_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Sub_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Summary_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Sup_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Svg_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Table_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Tbody_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Td_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Template_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Textarea_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Tfoot_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Th_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Thead_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Time_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Title_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Tr_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Track_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Tt_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.U_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Ul_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Var_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Video_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Wbr_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Animate_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.AnimateMotion_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.AnimateTransform_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.ClipPath_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Desc_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Discard_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.FeBlend_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.FeColorMatrix_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.FeComponentTransfer_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.FeComposite_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.FeDisplacementMap_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.FeDistantLight_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.FeDropShadow_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.FeFlood_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.FeFuncA_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.FeFuncB_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.FeFuncG_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.FeFuncR_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.FeGaussianBlur_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.FeImage_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.FeMerge_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.FeMergeNode_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.FeMorphology_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.FeOffset_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.FePointLight_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.FeSpecularLighting_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.FeSpotLight_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.FeTile_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.FeTurbulence_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Filter_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Image_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.LinearGradient_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Mask_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Metadata_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Mpath_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.RadialGradient_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Set_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Stop_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Switch_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Symbol_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Text_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.Tspan_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr Tags.View_ Tabindex String where
  pureAttr Tabindex value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tabindex", value }

  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "tabindex", value: prop' value }

instance Attr everything Tabindex Unit where
  pureAttr Tabindex _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "tabindex", value: unset' }
  mapAttr Tabindex evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "tabindex", value: unset' }
