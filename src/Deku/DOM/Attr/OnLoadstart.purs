module Deku.DOM.Attr.OnLoadstart where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnLoadstart = OnLoadstart

instance Attr anything OnLoadstart Cb where
  pureAttr OnLoadstart value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnLoadstart evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "loadstart", value: cb' value }

instance Attr anything OnLoadstart (Effect Unit) where
  pureAttr OnLoadstart value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnLoadstart evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "loadstart", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnLoadstart (Effect Boolean) where
  pureAttr OnLoadstart value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnLoadstart evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "loadstart", value: cb' (Cb (const value)) }

type OnLoadstartEffect =
  forall element
   . Attr element OnLoadstart (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnLoadstart Unit where
  pureAttr OnLoadstart _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "loadstart", value: unset' }
