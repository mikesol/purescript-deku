module Deku.DOM.Attr.OnPause where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnPause = OnPause

instance Attr anything OnPause (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnPause bothValues = unsafeAttribute $ Both
    { key: "pause", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "pause", value: cb' value })
instance Attr anything OnPause  Cb  where
  attr OnPause value = unsafeAttribute $ This
    { key: "pause", value: cb' value }
instance Attr anything OnPause (Event.Event  Cb ) where
  attr OnPause eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pause", value: cb' value }

instance Attr anything OnPause (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnPause bothValues = unsafeAttribute $ Both
    { key: "pause", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pause", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnPause  (Effect Unit)  where
  attr OnPause value = unsafeAttribute $ This
    { key: "pause", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPause (Event.Event  (Effect Unit) ) where
  attr OnPause eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pause", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPause (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnPause bothValues = unsafeAttribute $ Both
    { key: "pause", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pause", value: cb' (Cb (const value)) }
    )
instance Attr anything OnPause  (Effect Boolean)  where
  attr OnPause value = unsafeAttribute $ This
    { key: "pause", value: cb' (Cb (const value)) }
instance Attr anything OnPause (Event.Event  (Effect Boolean) ) where
  attr OnPause eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pause", value: cb' (Cb (const value)) }

type OnPauseEffect =
  forall element
   . Attr element OnPause (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPause (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnPause bothValues = unsafeAttribute $ Both
    { key: "pause", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "pause", value: unset' })
instance Attr everything OnPause  Unit  where
  attr OnPause _ = unsafeAttribute $ This { key: "pause", value: unset' }
instance Attr everything OnPause (Event.Event  Unit ) where
  attr OnPause eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "pause", value: unset' }
