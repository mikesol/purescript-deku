module Deku.DOM.Attr.Checked where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Checked = Checked

instance Attr Tags.Input_ Checked String where
  pureAttr Checked value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "checked", value }

  mapAttr Checked evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "checked", value: prop' value }

instance Attr everything Checked Unit where
  pureAttr Checked _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "checked", value: unset' }
  mapAttr Checked evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "checked", value: unset' }
