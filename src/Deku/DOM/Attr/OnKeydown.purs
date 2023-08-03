module Deku.DOM.Attr.OnKeydown where

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

data OnKeydown = OnKeydown

instance Attr anything OnKeydown (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnKeydown bothValues = unsafeAttribute $ Both (pure 
    { key: "keydown", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keydown", value: cb' value })
instance Attr anything OnKeydown (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnKeydown (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keydown", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keydown", value: cb' value })
instance Attr anything OnKeydown  Cb  where
  attr OnKeydown value = unsafeAttribute $ This $ pure $
    { key: "keydown", value: cb' value }
instance Attr anything OnKeydown (Event.Event  Cb ) where
  attr OnKeydown eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keydown", value: cb' value }

instance Attr anything OnKeydown (ST.ST Global.Global  Cb ) where
  attr OnKeydown stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keydown", value: cb' value }

instance Attr anything OnKeydown (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnKeydown bothValues = unsafeAttribute $ Both (pure 
    { key: "keydown", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "keydown", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnKeydown (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnKeydown (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keydown", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "keydown", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnKeydown  (Effect Unit)  where
  attr OnKeydown value = unsafeAttribute $ This $ pure $
    { key: "keydown", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnKeydown (Event.Event  (Effect Unit) ) where
  attr OnKeydown eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keydown", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnKeydown (ST.ST Global.Global  (Effect Unit) ) where
  attr OnKeydown stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keydown", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnKeydown (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnKeydown bothValues = unsafeAttribute $ Both (pure 
    { key: "keydown", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "keydown", value: cb' (Cb (const value)) }
    )
instance Attr anything OnKeydown (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnKeydown (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keydown", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "keydown", value: cb' (Cb (const value)) }
    )
instance Attr anything OnKeydown  (Effect Boolean)  where
  attr OnKeydown value = unsafeAttribute $ This $ pure $
    { key: "keydown", value: cb' (Cb (const value)) }
instance Attr anything OnKeydown (Event.Event  (Effect Boolean) ) where
  attr OnKeydown eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keydown", value: cb' (Cb (const value)) }

instance Attr anything OnKeydown (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnKeydown stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keydown", value: cb' (Cb (const value)) }

instance Attr everything OnKeydown (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnKeydown bothValues = unsafeAttribute $ Both (pure 
    { key: "keydown", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "keydown", value: unset' })
instance Attr everything OnKeydown (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnKeydown (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "keydown", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "keydown", value: unset' })
instance Attr everything OnKeydown  Unit  where
  attr OnKeydown _ = unsafeAttribute $ This $ pure $
    { key: "keydown", value: unset' }
instance Attr everything OnKeydown (Event.Event  Unit ) where
  attr OnKeydown eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "keydown", value: unset' }

instance Attr everything OnKeydown (ST.ST Global.Global  Unit ) where
  attr OnKeydown stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "keydown", value: unset' }
