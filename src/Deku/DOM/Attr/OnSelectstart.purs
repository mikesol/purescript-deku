module Deku.DOM.Attr.OnSelectstart where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnSelectstart = OnSelectstart

instance Attr anything OnSelectstart Cb where
  pureAttr OnSelectstart value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnSelectstart evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "selectstart", value: cb' value }

instance Attr anything OnSelectstart (Effect Unit) where
  pureAttr OnSelectstart value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnSelectstart evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "selectstart", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnSelectstart (Effect Boolean) where
  pureAttr OnSelectstart value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnSelectstart evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "selectstart", value: cb' (Cb (const value)) }

type OnSelectstartEffect =
  forall element
   . Attr element OnSelectstart (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnSelectstart Unit where
  pureAttr OnSelectstart _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "selectstart", value: unset' }
