module Deku.DOM.Attr.OnLoadend where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnLoadend = OnLoadend

instance Attr anything OnLoadend Cb where
  pureAttr OnLoadend value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "loadend", value: cb' value }
  mapAttr OnLoadend evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "loadend", value: cb' value }

instance Attr anything OnLoadend (Effect Unit) where
  pureAttr OnLoadend value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnLoadend evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "loadend", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnLoadend (Effect Boolean) where
  pureAttr OnLoadend value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnLoadend evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "loadend", value: cb' (Cb (const value)) }

type OnLoadendEffect =
  forall element
   . Attr element OnLoadend (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnLoadend Unit where
  pureAttr OnLoadend _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "loadend", value: unset' }
