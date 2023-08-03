module Deku.DOM.Attr.OnSelectionchange where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnSelectionchange = OnSelectionchange

instance Attr anything OnSelectionchange (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnSelectionchange bothValues = unsafeAttribute $ Both
    { key: "selectionchange", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "selectionchange", value: cb' value })
instance Attr anything OnSelectionchange  Cb  where
  attr OnSelectionchange value = unsafeAttribute $ This $ pure $
    { key: "selectionchange", value: cb' value }
instance Attr anything OnSelectionchange (Event.Event  Cb ) where
  attr OnSelectionchange eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "selectionchange", value: cb' value }

instance Attr anything OnSelectionchange (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnSelectionchange bothValues = unsafeAttribute $ Both
    { key: "selectionchange"
    , value: cb' (Cb (const ((NonEmpty.head bothValues) $> true)))
    }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "selectionchange", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnSelectionchange  (Effect Unit)  where
  attr OnSelectionchange value = unsafeAttribute $ This $ pure $
    { key: "selectionchange", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnSelectionchange (Event.Event  (Effect Unit) ) where
  attr OnSelectionchange eventValue = unsafeAttribute $ That $ eventValue
    <#> \value ->
      { key: "selectionchange", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnSelectionchange (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnSelectionchange bothValues = unsafeAttribute $ Both
    { key: "selectionchange", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "selectionchange", value: cb' (Cb (const value)) }
    )
instance Attr anything OnSelectionchange  (Effect Boolean)  where
  attr OnSelectionchange value = unsafeAttribute $ This $ pure $
    { key: "selectionchange", value: cb' (Cb (const value)) }
instance Attr anything OnSelectionchange (Event.Event  (Effect Boolean) ) where
  attr OnSelectionchange eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "selectionchange", value: cb' (Cb (const value)) }

type OnSelectionchangeEffect =
  forall element
   . Attr element OnSelectionchange (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnSelectionchange (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnSelectionchange bothValues = unsafeAttribute $ Both
    { key: "selectionchange", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "selectionchange", value: unset' })
instance Attr everything OnSelectionchange  Unit  where
  attr OnSelectionchange _ = unsafeAttribute $ This $ pure $
    { key: "selectionchange", value: unset' }
instance Attr everything OnSelectionchange (Event.Event  Unit ) where
  attr OnSelectionchange eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "selectionchange", value: unset' }
