module Deku.DOM.Attr.OnLoadedmetadata where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnLoadedmetadata = OnLoadedmetadata

instance Attr anything OnLoadedmetadata Cb where
  pureAttr OnLoadedmetadata value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "loadedmetadata", value: cb' value }
  mapAttr OnLoadedmetadata evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "loadedmetadata", value: cb' value }

instance Attr anything OnLoadedmetadata (Effect Unit) where
  pureAttr OnLoadedmetadata value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "loadedmetadata", value: cb' (Cb (const (value $> true))) }
  mapAttr OnLoadedmetadata evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "loadedmetadata", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnLoadedmetadata (Effect Boolean) where
  pureAttr OnLoadedmetadata value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "loadedmetadata", value: cb' (Cb (const value)) }
  mapAttr OnLoadedmetadata evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "loadedmetadata", value: cb' (Cb (const value)) }

type OnLoadedmetadataEffect =
  forall element
   . Attr element OnLoadedmetadata (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnLoadedmetadata Unit where
  pureAttr OnLoadedmetadata _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "loadedmetadata", value: unset' }

  mapAttr OnLoadedmetadata evalue = unsafeAttribute $ Right $ evalue <#> \_ ->
    unsafeVolatileAttribute
      { key: "loadedmetadata", value: unset' }