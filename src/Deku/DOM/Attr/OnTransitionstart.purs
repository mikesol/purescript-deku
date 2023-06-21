module Deku.DOM.Attr.OnTransitionstart where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnTransitionstart = OnTransitionstart

instance Attr anything OnTransitionstart Cb where
  pureAttr OnTransitionstart value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "transitionstart", value: cb' value }
  mapAttr OnTransitionstart evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "transitionstart", value: cb' value }

instance Attr anything OnTransitionstart (Effect Unit) where
  pureAttr OnTransitionstart value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "transitionstart", value: cb' (Cb (const (value $> true))) }
  mapAttr OnTransitionstart evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "transitionstart", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTransitionstart (Effect Boolean) where
  pureAttr OnTransitionstart value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "transitionstart", value: cb' (Cb (const value)) }
  mapAttr OnTransitionstart evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "transitionstart", value: cb' (Cb (const value)) }

type OnTransitionstartEffect =
  forall element
   . Attr element OnTransitionstart (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnTransitionstart Unit where
  pureAttr OnTransitionstart _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "transitionstart", value: unset' }

  mapAttr OnTransitionstart evalue = unsafeAttribute $ Right $ evalue <#> \_ ->
    unsafeVolatileAttribute
      { key: "transitionstart", value: unset' }