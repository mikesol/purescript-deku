module Deku.DOM.Attr.Spellcheck where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Spellcheck = Spellcheck

instance Attr Tags.A_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Abbr_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Acronym_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Address_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Applet_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Area_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Article_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Aside_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Audio_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.B_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Base_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Basefont_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Bdi_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Bdo_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Big_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Blockquote_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Body_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Br_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Button_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Canvas_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Caption_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Center_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Cite_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Code_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Col_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Colgroup_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Xdata_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Datalist_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Dd_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Del_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Details_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Dfn_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Dialog_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Dir_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Div_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Dl_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Dt_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Em_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Embed_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Fieldset_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Figcaption_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Figure_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Font_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Footer_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Form_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Frame_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Frameset_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.H1_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.H2_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.H3_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.H4_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.H5_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.H6_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Head_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Header_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Hr_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Html_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.I_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Iframe_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Img_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Input_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Ins_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Kbd_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Label_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Legend_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Li_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Link_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Main_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Map_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Mark_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Meta_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Meter_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Nav_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Noframes_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Noscript_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Object_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Ol_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Optgroup_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Option_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Output_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.P_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Param_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Picture_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Pre_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Progress_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Q_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Rp_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Rt_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Ruby_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.S_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Samp_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Script_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Section_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Select_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Small_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Source_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Span_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Strike_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Strong_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Style_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Sub_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Summary_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Sup_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Svg_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Table_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Tbody_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Td_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Template_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Textarea_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Tfoot_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Th_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Thead_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Time_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Title_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Tr_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Track_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Tt_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.U_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Ul_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Var_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Video_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr Tags.Wbr_ Spellcheck String where
  pureAttr Spellcheck value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "spellcheck", value }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: prop' value }

instance Attr everything Spellcheck Unit where
  pureAttr Spellcheck _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "spellcheck", value: unset' }
  mapAttr Spellcheck evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "spellcheck", value: unset' }
