-- | These functions uses the `SubgraphIsRenderable` typeclass to assert that an dom graph is renderable by the web dom engine. This means, amongst other things, that it has a unique output device (ie speaker), that it does not have any dangling units not connected to a loudspeaker, etc.
module Deku.Control.Functions.Subgraph
  ( makeScene
  , makeSceneFlipped
  , makeSceneR
  , makeSceneRFlipped
  , makeSceneR'
  , makeSceneR'Flipped
  , startUsing
  , startUsingWithHint
  , loopUsingScene
  , loopUsingSceneWithRes
  , loop
  , iloop
  , branch
  , ibranch
  , istart
  , freeze
  , (@>)
  , (@!>)
  , (@|>)
  , (@||>)
  , (<@)
  , (<|@)
  , (<||@)
  ) where

import Prelude

import Data.Either (Either)
import Effect (Effect)
import Deku.Change (class Change)
import Deku.Control.Functions (class GraphHint)
import Deku.Control.Functions as Functions
import Deku.Control.Indexed (IxDOM)
import Deku.Control.Types (Frame0, SubScene, DOM)
import Deku.Create (class Create)
import Deku.CreateT (class CreateT)
import Deku.Interpret (class DOMInterpret)
import Deku.Patch (class GetSubgraphs, class GetTumults, class Patch, PatchInfo)
import Deku.Validation (class SubgraphIsRenderable)

makeScene
  :: forall terminus env dom engine proofA push res graph a
   . Monoid res
  => DOMInterpret dom engine

  => ( Either env push
       -> (push -> Effect Unit)
       -> Either (SubScene terminus env dom engine proofA push res)
            (DOM dom engine proofA res graph a)
     )
  -> ( forall proofB
        . DOM dom engine proofB res graph a
       -> SubScene terminus env dom engine proofB push res
     )
  -> SubScene terminus env dom engine proofA push res
makeScene = Functions.makeScene

infixr 6 makeScene as @>

makeSceneFlipped
  :: forall terminus env dom engine proofA push res graph a
   . Monoid res
  => DOMInterpret dom engine

  => ( forall proofB
        . DOM dom engine proofB res graph a
       -> SubScene terminus env dom engine proofB push res
     )
  -> ( Either env push
       -> (push -> Effect Unit)
       -> Either (SubScene terminus env dom engine proofA push res)
            (DOM dom engine proofA res graph a)
     )
  -> SubScene terminus env dom engine proofA push res
makeSceneFlipped = Functions.makeSceneFlipped

infixr 6 makeSceneFlipped as <@

loop
  :: forall terminus env dom engine proofA push res graph a
   . Monoid res

  => DOMInterpret dom engine
  => ( forall proofB
        . DOM dom engine proofB res graph a
       -> Either env push
       -> (push -> Effect Unit)
       -> DOM dom engine proofB res graph a
     )
  -> DOM dom engine proofA res graph a
  -> SubScene terminus env dom engine proofA push res
loop = Functions.loop

iloop
  :: forall terminus env dom engine proofA push res graph a
   . Monoid res

  => DOMInterpret dom engine
  => ( forall proofB
        . Either env push
       -> (push -> Effect Unit)
       -> a
       -> IxDOM dom engine proofB res graph graph a
     )
  -> DOM dom engine proofA res graph a
  -> SubScene terminus env dom engine proofA push res
iloop = Functions.iloop

branch
  :: forall terminus env dom engine proofA push res graph a
   . Monoid res

  => DOMInterpret dom engine
  => ( forall proofB
        . DOM dom engine proofB res graph a
       -> Either env push
       -> (push -> Effect Unit)
       -> Either (SubScene terminus env dom engine proofB push res)
            (DOM dom engine proofB res graph a)
     )
  -> DOM dom engine proofA res graph a
  -> SubScene terminus env dom engine proofA push res
branch = Functions.branch

ibranch
  :: forall terminus env dom engine proofA push res graph a
   . Monoid res

  => DOMInterpret dom engine
  => ( forall proofB
        . Either env push
       -> (push -> Effect Unit)
       -> a
       -> Either
            ( DOM dom engine proofB res graph a
              -> SubScene terminus env dom engine proofB push res
            )
            (IxDOM dom engine proofB res graph graph a)
     )
  -> DOM dom engine proofA res graph a
  -> SubScene terminus env dom engine proofA push res
ibranch = Functions.ibranch

istart
  :: forall terminus env dom engine push res graph a
   . SubgraphIsRenderable graph terminus
  => Monoid res
  => DOMInterpret dom engine
  => ( env
       -> (push -> Effect Unit)
       -> IxDOM dom engine Frame0 res () graph a
     )
  -> ( forall proofB
        . DOM dom engine proofB res graph a
       -> SubScene terminus env dom engine proofB push res
     )
  -> SubScene terminus env dom engine Frame0 push res
istart = Functions.istart

infixr 6 istart as @!>

startUsing
  :: forall terminus env dom engine push res subgraphs tumults graph control
   . Monoid res
  => DOMInterpret dom engine

  => GetSubgraphs graph subgraphs
  => GetTumults graph tumults
  => Patch subgraphs tumults () graph
  => PatchInfo subgraphs tumults
  -> (env -> (push -> Effect Unit) -> control)
  -> ( forall proofA
        . DOM dom engine proofA res graph control
       -> SubScene terminus env dom engine proofA push res
     )
  -> SubScene terminus env dom engine Frame0 push res
startUsing = Functions.startUsing

startUsingWithHint
  :: forall terminus env dom engine push res hintable hint subgraphs tumults
       graph control
   . Monoid res
  => DOMInterpret dom engine

  => GraphHint hintable hint
  => CreateT hint () graph
  => GetSubgraphs graph subgraphs
  => GetTumults graph tumults
  => Patch subgraphs tumults () graph
  => hintable
  -> PatchInfo subgraphs tumults
  -> (env -> (push -> Effect Unit) -> control)
  -> ( forall proofA
        . DOM dom engine proofA res graph control
       -> SubScene terminus env dom engine proofA push res
     )
  -> SubScene terminus env dom engine Frame0 push res
startUsingWithHint = Functions.startUsingWithHint

loopUsingScene
  :: forall terminus env dom engine push res scene graph control
   . Monoid res
  => DOMInterpret dom engine
  => Create scene () graph
  => Change scene graph

  => ( env
       -> (push -> Effect Unit)
       -> control
       -> { scene :: { | scene }, control :: control }
     )
  -> ( Either env push
       -> (push -> Effect Unit)
       -> control
       -> { scene :: { | scene }, control :: control }
     )
  -> ( env
       -> (push -> Effect Unit)
       -> control
     )
  -> SubScene terminus env dom engine Frame0 push res
loopUsingScene = Functions.loopUsingScene

loopUsingSceneWithRes
  :: forall terminus env dom engine push res scene graph control
   . Monoid res
  => DOMInterpret dom engine
  => Create scene () graph
  => Change scene graph

  => ( env
       -> (push -> Effect Unit)
       -> control
       -> { scene :: { | scene }, control :: control, res :: res }
     )
  -> ( Either env push
       -> (push -> Effect Unit)
       -> control
       -> { scene :: { | scene }, control :: control, res :: res }
     )
  -> ( env
       -> (push -> Effect Unit)
       -> control
     )
  -> SubScene terminus env dom engine Frame0 push res
loopUsingSceneWithRes = Functions.loopUsingSceneWithRes

freeze
  :: forall terminus env dom engine proof push res graph x
   . Monoid res

  => DOMInterpret dom engine
  => DOM dom engine proof res graph x
  -> SubScene terminus env dom engine proof push res
freeze = Functions.freeze

makeSceneR
  :: forall terminus env dom engine proofA push res graph a
   . Monoid res

  => DOMInterpret dom engine
  => ( Either env push
       -> (push -> Effect Unit)
       -> DOM dom engine proofA res graph a
     )
  -> ( forall proofB
        . DOM dom engine proofB res graph a
       -> SubScene terminus env dom engine proofB push res
     )
  -> SubScene terminus env dom engine proofA push res
makeSceneR = Functions.makeSceneR

infixr 6 makeSceneR as @|>

makeSceneRFlipped
  :: forall terminus env dom engine proofA push res graph a
   . Monoid res

  => DOMInterpret dom engine
  => ( forall proofB
        . DOM dom engine proofB res graph a
       -> SubScene terminus env dom engine proofB push res
     )
  -> ( Either env push
       -> (push -> Effect Unit)
       -> DOM dom engine proofA res graph a
     )
  -> SubScene terminus env dom engine proofA push res
makeSceneRFlipped = Functions.makeSceneRFlipped

infixr 6 makeSceneRFlipped as <|@

makeSceneR'
  :: forall terminus env dom engine proofA push res graph a
   . Monoid res

  => DOMInterpret dom engine
  => DOM dom engine proofA res graph a
  -> ( forall proofB
        . DOM dom engine proofB res graph a
       -> SubScene terminus env dom engine proofB push res
     )
  -> SubScene terminus env dom engine proofA push res
makeSceneR' = Functions.makeSceneR'

infixr 6 makeSceneR' as @||>

makeSceneR'Flipped
  :: forall terminus env dom engine proofA push res graph a
   . Monoid res

  => DOMInterpret dom engine
  => ( forall proofB
        . DOM dom engine proofB res graph a
       -> SubScene terminus env dom engine proofB push res
     )
  -> DOM dom engine proofA res graph a
  -> SubScene terminus env dom engine proofA push res
makeSceneR'Flipped = Functions.makeSceneR'Flipped

infixr 6 makeSceneR'Flipped as <||@
