module Deku.DOM.Attr.OnLoadeddata where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnLoadeddata = OnLoadeddata

instance Attr anything OnLoadeddata Cb where
  pureAttr OnLoadeddata value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnLoadeddata evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "loadeddata", value: cb' value }

instance Attr anything OnLoadeddata (Effect Unit) where
  pureAttr OnLoadeddata value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnLoadeddata evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "loadeddata", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnLoadeddata (Effect Boolean) where
  pureAttr OnLoadeddata value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnLoadeddata evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "loadeddata", value: cb' (Cb (const value)) }

type OnLoadeddataEffect =
  forall element
   . Attr element OnLoadeddata (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnLoadeddata Unit where
  pureAttr OnLoadeddata _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "loadeddata", value: unset' }
