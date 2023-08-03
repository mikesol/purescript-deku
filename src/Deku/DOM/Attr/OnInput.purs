module Deku.DOM.Attr.OnInput where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnInput = OnInput

instance Attr anything OnInput (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnInput bothValues = unsafeAttribute $ Both
    { key: "input", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "input", value: cb' value })
instance Attr anything OnInput  Cb  where
  attr OnInput value = unsafeAttribute $ This $ pure $
    { key: "input", value: cb' value }
instance Attr anything OnInput (Event.Event  Cb ) where
  attr OnInput eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "input", value: cb' value }

instance Attr anything OnInput (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnInput bothValues = unsafeAttribute $ Both
    { key: "input", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "input", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnInput  (Effect Unit)  where
  attr OnInput value = unsafeAttribute $ This $ pure $
    { key: "input", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnInput (Event.Event  (Effect Unit) ) where
  attr OnInput eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "input", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnInput (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnInput bothValues = unsafeAttribute $ Both
    { key: "input", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "input", value: cb' (Cb (const value)) }
    )
instance Attr anything OnInput  (Effect Boolean)  where
  attr OnInput value = unsafeAttribute $ This $ pure $
    { key: "input", value: cb' (Cb (const value)) }
instance Attr anything OnInput (Event.Event  (Effect Boolean) ) where
  attr OnInput eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "input", value: cb' (Cb (const value)) }

type OnInputEffect =
  forall element
   . Attr element OnInput (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnInput (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnInput bothValues = unsafeAttribute $ Both
    { key: "input", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "input", value: unset' })
instance Attr everything OnInput  Unit  where
  attr OnInput _ = unsafeAttribute $ This $ pure $ { key: "input", value: unset' }
instance Attr everything OnInput (Event.Event  Unit ) where
  attr OnInput eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "input", value: unset' }
