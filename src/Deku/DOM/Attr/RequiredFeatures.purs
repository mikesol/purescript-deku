module Deku.DOM.Attr.RequiredFeatures where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data RequiredFeatures = RequiredFeatures

instance Attr Tags.AnimateTransform_ RequiredFeatures String where
  pureAttr RequiredFeatures value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "requiredFeatures", value }
  mapAttr RequiredFeatures evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "requiredFeatures", value: prop' value }

instance Attr Tags.Discard_ RequiredFeatures String where
  pureAttr RequiredFeatures value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "requiredFeatures", value }
  mapAttr RequiredFeatures evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "requiredFeatures", value: prop' value }

instance Attr Tags.Ellipse_ RequiredFeatures String where
  pureAttr RequiredFeatures value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "requiredFeatures", value }
  mapAttr RequiredFeatures evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "requiredFeatures", value: prop' value }

instance Attr Tags.ForeignObject_ RequiredFeatures String where
  pureAttr RequiredFeatures value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "requiredFeatures", value }
  mapAttr RequiredFeatures evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "requiredFeatures", value: prop' value }

instance Attr Tags.G_ RequiredFeatures String where
  pureAttr RequiredFeatures value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "requiredFeatures", value }
  mapAttr RequiredFeatures evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "requiredFeatures", value: prop' value }

instance Attr Tags.Image_ RequiredFeatures String where
  pureAttr RequiredFeatures value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "requiredFeatures", value }
  mapAttr RequiredFeatures evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "requiredFeatures", value: prop' value }

instance Attr Tags.Line_ RequiredFeatures String where
  pureAttr RequiredFeatures value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "requiredFeatures", value }
  mapAttr RequiredFeatures evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "requiredFeatures", value: prop' value }

instance Attr Tags.Marker_ RequiredFeatures String where
  pureAttr RequiredFeatures value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "requiredFeatures", value }
  mapAttr RequiredFeatures evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "requiredFeatures", value: prop' value }

instance Attr Tags.Mask_ RequiredFeatures String where
  pureAttr RequiredFeatures value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "requiredFeatures", value }
  mapAttr RequiredFeatures evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "requiredFeatures", value: prop' value }

instance Attr Tags.Path_ RequiredFeatures String where
  pureAttr RequiredFeatures value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "requiredFeatures", value }
  mapAttr RequiredFeatures evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "requiredFeatures", value: prop' value }

instance Attr Tags.Pattern_ RequiredFeatures String where
  pureAttr RequiredFeatures value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "requiredFeatures", value }
  mapAttr RequiredFeatures evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "requiredFeatures", value: prop' value }

instance Attr Tags.Polygon_ RequiredFeatures String where
  pureAttr RequiredFeatures value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "requiredFeatures", value }
  mapAttr RequiredFeatures evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "requiredFeatures", value: prop' value }

instance Attr Tags.Polyline_ RequiredFeatures String where
  pureAttr RequiredFeatures value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "requiredFeatures", value }
  mapAttr RequiredFeatures evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "requiredFeatures", value: prop' value }

instance Attr Tags.Rect_ RequiredFeatures String where
  pureAttr RequiredFeatures value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "requiredFeatures", value }
  mapAttr RequiredFeatures evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "requiredFeatures", value: prop' value }

instance Attr Tags.Svg_ RequiredFeatures String where
  pureAttr RequiredFeatures value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "requiredFeatures", value }
  mapAttr RequiredFeatures evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "requiredFeatures", value: prop' value }

instance Attr Tags.Switch_ RequiredFeatures String where
  pureAttr RequiredFeatures value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "requiredFeatures", value }
  mapAttr RequiredFeatures evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "requiredFeatures", value: prop' value }

instance Attr Tags.Text_ RequiredFeatures String where
  pureAttr RequiredFeatures value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "requiredFeatures", value }
  mapAttr RequiredFeatures evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "requiredFeatures", value: prop' value }

instance Attr Tags.TextPath_ RequiredFeatures String where
  pureAttr RequiredFeatures value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "requiredFeatures", value }
  mapAttr RequiredFeatures evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "requiredFeatures", value: prop' value }

instance Attr Tags.Tspan_ RequiredFeatures String where
  pureAttr RequiredFeatures value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "requiredFeatures", value }
  mapAttr RequiredFeatures evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "requiredFeatures", value: prop' value }

instance Attr Tags.Use_ RequiredFeatures String where
  pureAttr RequiredFeatures value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "requiredFeatures", value }
  mapAttr RequiredFeatures evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "requiredFeatures", value: prop' value }

instance Attr everything RequiredFeatures Unit where
  pureAttr RequiredFeatures _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "requiredFeatures", value: unset' }
  mapAttr RequiredFeatures evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "requiredFeatures", value: unset' }
