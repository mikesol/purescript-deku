module Deku.DOM.Attr.Azimuth where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Azimuth = Azimuth

instance Attr Tags.FeDistantLight_ Azimuth String where
  pureAttr Azimuth value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "azimuth", value }

  mapAttr Azimuth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "azimuth", value: prop' value }

instance Attr everything Azimuth Unit where
  pureAttr Azimuth _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "azimuth", value: unset' }
  mapAttr Azimuth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "azimuth", value: unset' }
