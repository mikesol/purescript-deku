module Deku.DOM.Attr.OnSelectionchange where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnSelectionchange = OnSelectionchange

instance Attr anything OnSelectionchange Cb where
  pureAttr OnSelectionchange value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnSelectionchange evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "selectionchange", value: cb' value }

instance Attr anything OnSelectionchange (Effect Unit) where
  pureAttr OnSelectionchange value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnSelectionchange evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "selectionchange", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnSelectionchange (Effect Boolean) where
  pureAttr OnSelectionchange value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnSelectionchange evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "selectionchange", value: cb' (Cb (const value)) }

type OnSelectionchangeEffect =
  forall element
   . Attr element OnSelectionchange (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnSelectionchange Unit where
  pureAttr OnSelectionchange _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "selectionchange", value: unset' }
