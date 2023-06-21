module Deku.DOM.Attr.Role where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Role = Role

instance Attr Tags.A_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Abbr_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Acronym_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Address_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Applet_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Area_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Article_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Aside_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Audio_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.B_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Base_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Basefont_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Bdi_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Bdo_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Big_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Blockquote_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Body_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Br_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Button_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Canvas_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Caption_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Center_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Cite_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Code_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Col_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Colgroup_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Xdata_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Datalist_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Dd_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Del_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Details_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Dfn_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Dialog_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Dir_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Div_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Dl_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Dt_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Em_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Embed_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Fieldset_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Figcaption_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Figure_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Font_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Footer_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Form_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Frame_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Frameset_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.H1_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.H2_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.H3_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.H4_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.H5_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.H6_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Head_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Header_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Hr_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Html_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.I_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Iframe_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Img_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Input_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Ins_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Kbd_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Label_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Legend_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Li_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Link_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Main_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Map_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Mark_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Meta_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Meter_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Nav_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Noframes_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Noscript_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Object_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Ol_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Optgroup_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Option_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Output_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.P_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Param_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Picture_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Pre_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Progress_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Q_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Rp_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Rt_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Ruby_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.S_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Samp_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Script_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Section_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Select_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Small_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Source_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Span_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Strike_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Strong_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Style_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Sub_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Summary_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Sup_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Svg_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Table_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Tbody_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Td_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Template_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Textarea_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Tfoot_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Th_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Thead_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Time_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Title_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Tr_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Track_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Tt_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.U_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Ul_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Var_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Video_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Wbr_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Circle_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Ellipse_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.ForeignObject_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.G_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Line_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Marker_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Path_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Polygon_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Polyline_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Rect_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Symbol_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Text_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.TextPath_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Tspan_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.Use_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr Tags.View_ Role String where
  pureAttr Role value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "role", value }

  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "role", value: prop' value }

instance Attr everything Role Unit where
  pureAttr Role _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "role", value: unset' }
  mapAttr Role evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "role", value: unset' }
