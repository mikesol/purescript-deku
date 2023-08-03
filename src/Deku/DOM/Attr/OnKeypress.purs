module Deku.DOM.Attr.OnKeypress where

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

data OnKeypress = OnKeypress

instance Attr anything OnKeypress (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnKeypress bothValues = unsafeAttribute $ Both (pure 
    { key: "keypress", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keypress", value: cb' value })
instance Attr anything OnKeypress (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnKeypress (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keypress", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keypress", value: cb' value })
instance Attr anything OnKeypress  Cb  where
  attr OnKeypress value = unsafeAttribute $ This $ pure $
    { key: "keypress", value: cb' value }
instance Attr anything OnKeypress (Event.Event  Cb ) where
  attr OnKeypress eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keypress", value: cb' value }

instance Attr anything OnKeypress (ST.ST Global.Global  Cb ) where
  attr OnKeypress stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keypress", value: cb' value }

instance Attr anything OnKeypress (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnKeypress bothValues = unsafeAttribute $ Both (pure 
    { key: "keypress", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "keypress", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnKeypress (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnKeypress (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keypress", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "keypress", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnKeypress  (Effect Unit)  where
  attr OnKeypress value = unsafeAttribute $ This $ pure $
    { key: "keypress", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnKeypress (Event.Event  (Effect Unit) ) where
  attr OnKeypress eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keypress", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnKeypress (ST.ST Global.Global  (Effect Unit) ) where
  attr OnKeypress stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keypress", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnKeypress (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnKeypress bothValues = unsafeAttribute $ Both (pure 
    { key: "keypress", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "keypress", value: cb' (Cb (const value)) }
    )
instance Attr anything OnKeypress (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnKeypress (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keypress", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "keypress", value: cb' (Cb (const value)) }
    )
instance Attr anything OnKeypress  (Effect Boolean)  where
  attr OnKeypress value = unsafeAttribute $ This $ pure $
    { key: "keypress", value: cb' (Cb (const value)) }
instance Attr anything OnKeypress (Event.Event  (Effect Boolean) ) where
  attr OnKeypress eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keypress", value: cb' (Cb (const value)) }

instance Attr anything OnKeypress (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnKeypress stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keypress", value: cb' (Cb (const value)) }

instance Attr everything OnKeypress (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnKeypress bothValues = unsafeAttribute $ Both (pure 
    { key: "keypress", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "keypress", value: unset' })
instance Attr everything OnKeypress (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnKeypress (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "keypress", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "keypress", value: unset' })
instance Attr everything OnKeypress  Unit  where
  attr OnKeypress _ = unsafeAttribute $ This $ pure $
    { key: "keypress", value: unset' }
instance Attr everything OnKeypress (Event.Event  Unit ) where
  attr OnKeypress eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "keypress", value: unset' }

instance Attr everything OnKeypress (ST.ST Global.Global  Unit ) where
  attr OnKeypress stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "keypress", value: unset' }
