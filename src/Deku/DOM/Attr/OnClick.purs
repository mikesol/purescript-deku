module Deku.DOM.Attr.OnClick where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnClick = OnClick

instance Attr anything OnClick (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnClick bothValues = unsafeAttribute $ Both (pure 
    { key: "click", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "click", value: cb' value })
instance Attr anything OnClick  Cb  where
  attr OnClick value = unsafeAttribute $ This $ pure $
    { key: "click", value: cb' value }
instance Attr anything OnClick (Event.Event  Cb ) where
  attr OnClick eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "click", value: cb' value }

instance Attr anything OnClick (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnClick bothValues = unsafeAttribute $ Both (pure 
    { key: "click", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "click", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnClick  (Effect Unit)  where
  attr OnClick value = unsafeAttribute $ This $ pure $
    { key: "click", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnClick (Event.Event  (Effect Unit) ) where
  attr OnClick eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "click", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnClick (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnClick bothValues = unsafeAttribute $ Both (pure 
    { key: "click", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "click", value: cb' (Cb (const value)) }
    )
instance Attr anything OnClick  (Effect Boolean)  where
  attr OnClick value = unsafeAttribute $ This $ pure $
    { key: "click", value: cb' (Cb (const value)) }
instance Attr anything OnClick (Event.Event  (Effect Boolean) ) where
  attr OnClick eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "click", value: cb' (Cb (const value)) }

type OnClickEffect =
  forall element
   . Attr element OnClick (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnClick (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnClick bothValues = unsafeAttribute $ Both (pure 
    { key: "click", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "click", value: unset' })
instance Attr everything OnClick  Unit  where
  attr OnClick _ = unsafeAttribute $ This $ pure $ { key: "click", value: unset' }
instance Attr everything OnClick (Event.Event  Unit ) where
  attr OnClick eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "click", value: unset' }
