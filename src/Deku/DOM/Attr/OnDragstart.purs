module Deku.DOM.Attr.OnDragstart where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnDragstart = OnDragstart

instance Attr anything OnDragstart (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnDragstart bothValues = unsafeAttribute $ Both (pure 
    { key: "dragstart", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dragstart", value: cb' value })
instance Attr anything OnDragstart  Cb  where
  attr OnDragstart value = unsafeAttribute $ This $ pure $
    { key: "dragstart", value: cb' value }
instance Attr anything OnDragstart (Event.Event  Cb ) where
  attr OnDragstart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "dragstart", value: cb' value }

instance Attr anything OnDragstart (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnDragstart bothValues = unsafeAttribute $ Both (pure 
    { key: "dragstart", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "dragstart", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnDragstart  (Effect Unit)  where
  attr OnDragstart value = unsafeAttribute $ This $ pure $
    { key: "dragstart", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnDragstart (Event.Event  (Effect Unit) ) where
  attr OnDragstart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "dragstart", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDragstart (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnDragstart bothValues = unsafeAttribute $ Both (pure 
    { key: "dragstart", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "dragstart", value: cb' (Cb (const value)) }
    )
instance Attr anything OnDragstart  (Effect Boolean)  where
  attr OnDragstart value = unsafeAttribute $ This $ pure $
    { key: "dragstart", value: cb' (Cb (const value)) }
instance Attr anything OnDragstart (Event.Event  (Effect Boolean) ) where
  attr OnDragstart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "dragstart", value: cb' (Cb (const value)) }

type OnDragstartEffect =
  forall element
   . Attr element OnDragstart (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnDragstart (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnDragstart bothValues = unsafeAttribute $ Both (pure 
    { key: "dragstart", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "dragstart", value: unset' })
instance Attr everything OnDragstart  Unit  where
  attr OnDragstart _ = unsafeAttribute $ This $ pure $
    { key: "dragstart", value: unset' }
instance Attr everything OnDragstart (Event.Event  Unit ) where
  attr OnDragstart eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "dragstart", value: unset' }
