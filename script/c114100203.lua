--★淡海の天魔
function c114100203.initial_effect(c)
	--synchro summon
	aux.AddSynchroProcedure(c,nil,aux.NonTuner(nil),1)
	c:EnableReviveLimit()
	--atk
	local e1=Effect.CreateEffect(c)
	e1:SetCategory(CATEGORY_SPECIAL_SUMMON)
	e1:SetType(EFFECT_TYPE_QUICK_O)
	e1:SetCode(EVENT_ATTACK_ANNOUNCE)
	e1:SetRange(LOCATION_EXTRA)
	e1:SetCountLimit(1,114100203+EFFECT_COUNT_CODE_DUEL)
	e1:SetCondition(c114100203.spcon)
	e1:SetCost(c114100203.spcost)
	e1:SetTarget(c114100203.sptg)
	e1:SetOperation(c114100203.spop)
	c:RegisterEffect(e1)
end
function c114100203.confilter(c)
	return ( c:IsType(TYPE_XYZ) or c:IsLevelAbove(5) ) and c:IsFaceup()
end
function c114100203.confilter2(c)
	return ( c:IsFaceup() or c:IsLocation(LOCATION_GRAVE) ) 
	and ( c:IsSetCard(0x221) or c:IsSetCard(0x988) )
end
function c114100203.confilter3(c)
	return ( c:IsFacedown() and c:IsLocation(LOCATION_MZONE) ) 
	or not ( c:IsSetCard(0x221) or c:IsSetCard(0x988) )
end
function c114100203.spcon(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(c114100203.confilter,tp,0,LOCATION_MZONE,1,nil)
	and Duel.IsExistingMatchingCard(c114100203.confilter2,tp,LOCATION_MZONE+LOCATION_GRAVE,0,1,nil)
	and not Duel.IsExistingMatchingCard(c114100203.confilter3,tp,LOCATION_MZONE+LOCATION_GRAVE,0,1,nil)
	and Duel.GetAttacker():IsControler(1-tp)
end
function c114100203.costf(c)
	return c:IsType(TYPE_MONSTER) and c:IsAbleToRemoveAsCost()
end
function c114100203.spcost(e,tp,eg,ep,ev,re,r,rp,chk)
	local cg=Duel.GetMatchingGroup(c114100203.costf,tp,LOCATION_GRAVE,0,nil)
	if chk==0 then 
		return cg:CheckWithSumGreater(Card.GetLevel,6)
	end
	local rg=cg:SelectWithSumGreater(tp,Card.GetLevel,6)
	Duel.Remove(rg,POS_FACEUP,REASON_COST)
end
function c114100203.sptg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then 
		return Duel.GetLocationCount(tp,LOCATION_MZONE)>0 
		and e:GetHandler():IsCanBeSpecialSummoned(e,0,tp,false,false)
	end
	Duel.SetOperationInfo(0,CATEGORY_SPECIAL_SUMMON,e:GetHandler(),1,0,0)
end
function c114100203.spop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if c:IsRelateToEffect(e) then
		Duel.SpecialSummon(c,0,tp,tp,false,false,POS_FACEUP)
		c:CompleteProcedure()
	end
end