module Deku.DOM.Attr.OnSubmit where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnSubmit = OnSubmit

instance Attr anything OnSubmit (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnSubmit bothValues = unsafeAttribute $ Both (pure 
    { key: "submit", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "submit", value: cb' value })
instance Attr anything OnSubmit  Cb  where
  attr OnSubmit value = unsafeAttribute $ This $ pure $
    { key: "submit", value: cb' value }
instance Attr anything OnSubmit (Event.Event  Cb ) where
  attr OnSubmit eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "submit", value: cb' value }

instance Attr anything OnSubmit (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnSubmit bothValues = unsafeAttribute $ Both (pure 
    { key: "submit", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "submit", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnSubmit  (Effect Unit)  where
  attr OnSubmit value = unsafeAttribute $ This $ pure $
    { key: "submit", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnSubmit (Event.Event  (Effect Unit) ) where
  attr OnSubmit eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "submit", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnSubmit (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnSubmit bothValues = unsafeAttribute $ Both (pure 
    { key: "submit", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "submit", value: cb' (Cb (const value)) }
    )
instance Attr anything OnSubmit  (Effect Boolean)  where
  attr OnSubmit value = unsafeAttribute $ This $ pure $
    { key: "submit", value: cb' (Cb (const value)) }
instance Attr anything OnSubmit (Event.Event  (Effect Boolean) ) where
  attr OnSubmit eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "submit", value: cb' (Cb (const value)) }

type OnSubmitEffect =
  forall element
   . Attr element OnSubmit (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnSubmit (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnSubmit bothValues = unsafeAttribute $ Both (pure 
    { key: "submit", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "submit", value: unset' })
instance Attr everything OnSubmit  Unit  where
  attr OnSubmit _ = unsafeAttribute $ This $ pure $ { key: "submit", value: unset' }
instance Attr everything OnSubmit (Event.Event  Unit ) where
  attr OnSubmit eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "submit", value: unset' }
