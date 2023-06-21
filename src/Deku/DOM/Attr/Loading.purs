module Deku.DOM.Attr.Loading where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Loading = Loading

instance Attr Tags.Img_ Loading String where
  pureAttr Loading value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "loading ", value }

  mapAttr Loading evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "loading ", value: prop' value }

instance Attr Tags.Iframe_ Loading String where
  pureAttr Loading value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "loading ", value }

  mapAttr Loading evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "loading ", value: prop' value }

instance Attr everything Loading Unit where
  pureAttr Loading _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "loading ", value: unset' }
  mapAttr Loading evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "loading ", value: unset' }
