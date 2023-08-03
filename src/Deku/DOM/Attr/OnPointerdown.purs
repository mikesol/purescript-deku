module Deku.DOM.Attr.OnPointerdown where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnPointerdown = OnPointerdown

instance Attr anything OnPointerdown (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnPointerdown bothValues = unsafeAttribute $ Both (pure 
    { key: "pointerdown", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointerdown", value: cb' value })
instance Attr anything OnPointerdown (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnPointerdown (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointerdown", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointerdown", value: cb' value })
instance Attr anything OnPointerdown  Cb  where
  attr OnPointerdown value = unsafeAttribute $ This $ pure $
    { key: "pointerdown", value: cb' value }
instance Attr anything OnPointerdown (Event.Event  Cb ) where
  attr OnPointerdown eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerdown", value: cb' value }

instance Attr anything OnPointerdown (ST.ST Global.Global  Cb ) where
  attr OnPointerdown stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointerdown", value: cb' value }

instance Attr anything OnPointerdown (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnPointerdown bothValues = unsafeAttribute $ Both (pure 
    { key: "pointerdown", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointerdown", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnPointerdown (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnPointerdown (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointerdown", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "pointerdown", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnPointerdown  (Effect Unit)  where
  attr OnPointerdown value = unsafeAttribute $ This $ pure $
    { key: "pointerdown", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPointerdown (Event.Event  (Effect Unit) ) where
  attr OnPointerdown eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerdown", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerdown (ST.ST Global.Global  (Effect Unit) ) where
  attr OnPointerdown stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointerdown", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerdown (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnPointerdown bothValues = unsafeAttribute $ Both (pure 
    { key: "pointerdown", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointerdown", value: cb' (Cb (const value)) }
    )
instance Attr anything OnPointerdown (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnPointerdown (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pointerdown", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "pointerdown", value: cb' (Cb (const value)) }
    )
instance Attr anything OnPointerdown  (Effect Boolean)  where
  attr OnPointerdown value = unsafeAttribute $ This $ pure $
    { key: "pointerdown", value: cb' (Cb (const value)) }
instance Attr anything OnPointerdown (Event.Event  (Effect Boolean) ) where
  attr OnPointerdown eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerdown", value: cb' (Cb (const value)) }

instance Attr anything OnPointerdown (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnPointerdown stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pointerdown", value: cb' (Cb (const value)) }

instance Attr everything OnPointerdown (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnPointerdown bothValues = unsafeAttribute $ Both (pure 
    { key: "pointerdown", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "pointerdown", value: unset' })
instance Attr everything OnPointerdown (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnPointerdown (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "pointerdown", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "pointerdown", value: unset' })
instance Attr everything OnPointerdown  Unit  where
  attr OnPointerdown _ = unsafeAttribute $ This $ pure $
    { key: "pointerdown", value: unset' }
instance Attr everything OnPointerdown (Event.Event  Unit ) where
  attr OnPointerdown eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "pointerdown", value: unset' }

instance Attr everything OnPointerdown (ST.ST Global.Global  Unit ) where
  attr OnPointerdown stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "pointerdown", value: unset' }
