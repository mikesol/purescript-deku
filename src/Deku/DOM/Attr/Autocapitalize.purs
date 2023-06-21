module Deku.DOM.Attr.Autocapitalize where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Autocapitalize = Autocapitalize

instance Attr Tags.A_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Abbr_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Acronym_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Address_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Applet_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Area_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Article_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Aside_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Audio_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.B_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Base_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Basefont_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Bdi_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Bdo_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Big_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Blockquote_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Body_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Br_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Button_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Canvas_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Caption_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Center_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Cite_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Code_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Col_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Colgroup_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Xdata_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Datalist_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Dd_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Del_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Details_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Dfn_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Dialog_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Dir_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Div_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Dl_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Dt_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Em_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Embed_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Fieldset_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Figcaption_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Figure_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Font_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Footer_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Form_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Frame_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Frameset_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.H1_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.H2_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.H3_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.H4_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.H5_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.H6_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Head_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Header_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Hr_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Html_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.I_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Iframe_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Img_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Input_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Ins_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Kbd_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Label_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Legend_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Li_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Link_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Main_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Map_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Mark_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Meta_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Meter_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Nav_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Noframes_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Noscript_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Object_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Ol_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Optgroup_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Option_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Output_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.P_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Param_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Picture_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Pre_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Progress_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Q_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Rp_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Rt_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Ruby_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.S_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Samp_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Script_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Section_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Select_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Small_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Source_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Span_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Strike_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Strong_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Style_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Sub_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Summary_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Sup_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Svg_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Table_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Tbody_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Td_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Template_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Textarea_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Tfoot_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Th_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Thead_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Time_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Title_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Tr_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Track_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Tt_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.U_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Ul_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Var_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Video_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr Tags.Wbr_ Autocapitalize String where
  pureAttr Autocapitalize value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "autocapitalize", value }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: prop' value }

instance Attr everything Autocapitalize Unit where
  pureAttr Autocapitalize _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "autocapitalize", value: unset' }
  mapAttr Autocapitalize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "autocapitalize", value: unset' }
