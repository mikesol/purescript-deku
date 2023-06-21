module Deku.DOM.Attr.OnPointerlockchange where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnPointerlockchange = OnPointerlockchange

instance Attr anything OnPointerlockchange Cb where
  pureAttr OnPointerlockchange value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "pointerlockchange ", value: cb' value }
  mapAttr OnPointerlockchange evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "pointerlockchange ", value: cb' value }

instance Attr anything OnPointerlockchange (Effect Unit) where
  pureAttr OnPointerlockchange value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "pointerlockchange ", value: cb' (Cb (const (value $> true))) }
  mapAttr OnPointerlockchange evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "pointerlockchange ", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerlockchange (Effect Boolean) where
  pureAttr OnPointerlockchange value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "pointerlockchange ", value: cb' (Cb (const value)) }
  mapAttr OnPointerlockchange evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "pointerlockchange ", value: cb' (Cb (const value)) }

type OnPointerlockchangeEffect =
  forall element
   . Attr element OnPointerlockchange (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPointerlockchange Unit where
  pureAttr OnPointerlockchange _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "pointerlockchange ", value: unset' }

  mapAttr OnPointerlockchange evalue = unsafeAttribute $ Right $ evalue <#>
    \_ ->
      unsafeVolatileAttribute
        { key: "pointerlockchange ", value: unset' }