module Deku.DOM.Attr.OnSelect where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnSelect = OnSelect

instance Attr anything OnSelect (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnSelect bothValues = unsafeAttribute $ Both
    { key: "select", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "select", value: cb' value })
instance Attr anything OnSelect  Cb  where
  attr OnSelect value = unsafeAttribute $ This $ pure $
    { key: "select", value: cb' value }
instance Attr anything OnSelect (Event.Event  Cb ) where
  attr OnSelect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "select", value: cb' value }

instance Attr anything OnSelect (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnSelect bothValues = unsafeAttribute $ Both
    { key: "select", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "select", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnSelect  (Effect Unit)  where
  attr OnSelect value = unsafeAttribute $ This $ pure $
    { key: "select", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnSelect (Event.Event  (Effect Unit) ) where
  attr OnSelect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "select", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnSelect (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnSelect bothValues = unsafeAttribute $ Both
    { key: "select", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "select", value: cb' (Cb (const value)) }
    )
instance Attr anything OnSelect  (Effect Boolean)  where
  attr OnSelect value = unsafeAttribute $ This $ pure $
    { key: "select", value: cb' (Cb (const value)) }
instance Attr anything OnSelect (Event.Event  (Effect Boolean) ) where
  attr OnSelect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "select", value: cb' (Cb (const value)) }

type OnSelectEffect =
  forall element
   . Attr element OnSelect (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnSelect (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnSelect bothValues = unsafeAttribute $ Both
    { key: "select", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "select", value: unset' })
instance Attr everything OnSelect  Unit  where
  attr OnSelect _ = unsafeAttribute $ This $ pure $ { key: "select", value: unset' }
instance Attr everything OnSelect (Event.Event  Unit ) where
  attr OnSelect eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "select", value: unset' }
