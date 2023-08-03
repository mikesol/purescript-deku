module Deku.DOM.Attr.OnFocus where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnFocus = OnFocus

instance Attr anything OnFocus (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnFocus bothValues = unsafeAttribute $ Both (pure 
    { key: "focus", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "focus", value: cb' value })
instance Attr anything OnFocus  Cb  where
  attr OnFocus value = unsafeAttribute $ This $ pure $
    { key: "focus", value: cb' value }
instance Attr anything OnFocus (Event.Event  Cb ) where
  attr OnFocus eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "focus", value: cb' value }

instance Attr anything OnFocus (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnFocus bothValues = unsafeAttribute $ Both (pure 
    { key: "focus", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "focus", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnFocus  (Effect Unit)  where
  attr OnFocus value = unsafeAttribute $ This $ pure $
    { key: "focus", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnFocus (Event.Event  (Effect Unit) ) where
  attr OnFocus eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "focus", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnFocus (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnFocus bothValues = unsafeAttribute $ Both (pure 
    { key: "focus", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "focus", value: cb' (Cb (const value)) }
    )
instance Attr anything OnFocus  (Effect Boolean)  where
  attr OnFocus value = unsafeAttribute $ This $ pure $
    { key: "focus", value: cb' (Cb (const value)) }
instance Attr anything OnFocus (Event.Event  (Effect Boolean) ) where
  attr OnFocus eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "focus", value: cb' (Cb (const value)) }

type OnFocusEffect =
  forall element
   . Attr element OnFocus (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnFocus (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnFocus bothValues = unsafeAttribute $ Both (pure 
    { key: "focus", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "focus", value: unset' })
instance Attr everything OnFocus  Unit  where
  attr OnFocus _ = unsafeAttribute $ This $ pure $ { key: "focus", value: unset' }
instance Attr everything OnFocus (Event.Event  Unit ) where
  attr OnFocus eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "focus", value: unset' }
