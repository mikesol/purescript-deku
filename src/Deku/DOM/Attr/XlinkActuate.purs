module Deku.DOM.Attr.XlinkActuate where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data XlinkActuate = XlinkActuate

instance Attr Tags.AnimateTransform_ XlinkActuate String where
  pureAttr XlinkActuate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xlink:actuate", value }
  mapAttr XlinkActuate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:actuate", value: prop' value }

instance Attr Tags.FeImage_ XlinkActuate String where
  pureAttr XlinkActuate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xlink:actuate", value }
  mapAttr XlinkActuate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:actuate", value: prop' value }

instance Attr Tags.Filter_ XlinkActuate String where
  pureAttr XlinkActuate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xlink:actuate", value }
  mapAttr XlinkActuate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:actuate", value: prop' value }

instance Attr Tags.Image_ XlinkActuate String where
  pureAttr XlinkActuate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xlink:actuate", value }
  mapAttr XlinkActuate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:actuate", value: prop' value }

instance Attr Tags.Mpath_ XlinkActuate String where
  pureAttr XlinkActuate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "xlink:actuate", value }
  mapAttr XlinkActuate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:actuate", value: prop' value }

instance Attr everything XlinkActuate Unit where
  pureAttr XlinkActuate _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "xlink:actuate", value: unset' }
  mapAttr XlinkActuate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "xlink:actuate", value: unset' }
